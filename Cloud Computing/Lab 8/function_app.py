
import azure.functions as func

app = func.FunctionApp(
    http_auth_level=func.AuthLevel.ANONYMOUS
)


@app.route(route="Calculate", methods=["GET"])
def Calculate(req: func.HttpRequest) -> func.HttpResponse:

    try:
        a = int(req.params.get("a", "0"))
        b = int(req.params.get("b", "0"))

        result = a + b

        return func.HttpResponse(
            f"The sum is: {result}",
            status_code=200
        )

    except ValueError:
        return func.HttpResponse(
            "Please provide valid numbers.",
            status_code=400
        )



@app.route(route="HelloStudent", methods=["GET"])
def HelloStudent(req: func.HttpRequest) -> func.HttpResponse:

    name = req.params.get("name", "Student")
    course = req.params.get("course", "Cloud Computing")

    message = f"Hello {name}! Welcome to {course}."

    return func.HttpResponse(
        message,
        status_code=200
    )

