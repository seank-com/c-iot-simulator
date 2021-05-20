# c-iot-simulator
A simulator chiller for use in the Remote Monitoring solution accelerator

## Build

```bash
$ docker build --build-arg connection_string="HostName=iothub-yhb5s.azure-devices.net;DeviceId=CraigsPi;SharedAccessKey=g2dJnh+1a/nxOUN7DjfqLUMEHNre8SgMbh/mXfVKRFo=" -t c-iot-simulator .
```
