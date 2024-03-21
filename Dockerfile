FROM alpine:latest AS phpalpine

WORKDIR /app
COPY    /app .

RUN apk add --no-cache go
RUN go build fullcycle.go

FROM scratch AS phpminimo 
WORKDIR /app
COPY --from=phpalpine /app .
CMD ["./fullcycle"]