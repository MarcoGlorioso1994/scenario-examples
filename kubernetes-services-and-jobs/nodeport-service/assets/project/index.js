const http = require("node:http");

http
  .createServer((request, response) => {
    let body = [];
    request
      .on("data", (chunk) => {
        body.push(chunk);
      })
      .on("end", () => {
        body = Buffer.concat(body).toString();
        if (body === "ping") {
          response.end("pong");
        } else {
          response.end("why no ping :(");
        }
      });
  })
  .listen(8080, () =>
    console.log("🚀 Server running and listening on http://localhost:8080")
  );
