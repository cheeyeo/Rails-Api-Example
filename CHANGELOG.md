21st June, 2014

* Added use of MesssagePack using yarinage.js to handle api responses in the UI and msgpack-ruby gem to generate the responses.

* Added a home controller and views to show the output

* Added Serializer using Oat gem in /api/v2 routes to demonstrate use of
a JSONAPI serializer. Can be replaced with ActivemodelSerializer

* Added to_msgpack method inside Article class in order to serialize it using MesssagePack. Can also be replaced with a custom ActivemodelSerializer.

* Added custom mime type and renderer for MesssagePack


