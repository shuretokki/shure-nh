import { App } from "astal/gtk3"
import Bar from "./widget/Bar"

App.start({
    instanceName: "astal",
    requestHandler(request, res) {
        res("ok")
    },
    main: () => {
        Bar(0)
    },
})
