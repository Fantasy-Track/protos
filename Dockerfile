FROM alpine:3

RUN apk update
RUN apk add protobuf-dev git

RUN git clone https://github.com/googleapis/api-common-protos.git

COPY *.proto /fantasytrack/proto/
WORKDIR /fantasytrack

RUN protoc proto/*.proto -Iproto -I/api-common-protos --include_imports --include_source_info --descriptor_set_out=proto.pb
