import datetime, json, uuid
import azure.functions as func


def main(req: func.HttpRequest, jobItems: func.SqlRowList, outputEvent: func.Out[func.EventGridOutputEvent], jobItemsUpdate: func.Out[func.SqlRow] ) -> func.HttpResponse:
    rows = list(map(lambda r: json.loads(r.to_json()), jobItems))
    
    # Update status for inbound jobs
    for i in rows:
        i.update({"JobStepStatus": "ADF_Processing"})

    # Set ouputs
    outputEvent.set(func.EventGridOutputEvent(id=str(uuid.uuid4()), subject="adf-test-subject", event_type="adf-event-1",
                    data=rows, event_time=datetime.datetime.utcnow(), data_version="1.0"))
    jobItemsUpdate.set(func.SqlRowList(rows))

    return func.HttpResponse(
        json.dumps(rows),
        status_code=200,
        mimetype="application/json"
    )
