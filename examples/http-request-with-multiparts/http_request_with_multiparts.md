# HTTP client - Request with multiparts

Ballerina supports encoding and decoding multipart content in http requests along with nested parts. When you request multiparts from the HTTP inbound request, you get an array of body parts (an array of entities). You can loop through this array and handle the received body parts according to your requirement.

::: code http_request_with_multiparts.bal :::

Run the service as follows.

::: out http_request_with_multiparts.server.out :::

Invoke the service by executing the following cURL command in a new terminal.
In the directory, which contains the `.bal` file, create a directory named `file`, and add an XML files named `test.xml` in it.

::: out http_request_with_multiparts.client.out :::

## Related links
- [`setBodyParts()` - API documentation](https://lib.ballerina.io/ballerina/http/latest/classes/Request#setBodyParts)
- [HTTP client supported-multipart-types - Specification](/spec/mime/#3-supported-multipart-types)