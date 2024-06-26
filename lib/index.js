const express = require('express');
const { RtcTokenBuilder, RtcRole } = require('agora-access-token');

const APP_ID = 'c1d60238dbf54cb5941d3ca7c0b1d6df';
const APP_CERTIFICATE = '007eJxTYPDaUB/6IiFD1dRPxfyYGuNCuYa4Q8zbxJNn7uFM6hYtNVNgSDZMMTMwMrZISUozNUlOMrU0MUwxTk40TzZIAsqkpCktqE5rCGRkOBy5moWRAQJBfBYGx4zEFAYGADxmHBg=';

const app = express();

const nocache = (req, resp, next) => {
  resp.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
  resp.header('Express', '-1');
  resp.header('Pragma', 'no-cache');
  next();
};

const generateAccessToken = (req, resp) => {
  resp.header('Access-Control-Allow-Origin', '*');

  const channelName = req.query.channelName;
  if (!channelName) {
    return resp.status(500).json({ 'error': 'channel is required' });
  }

  let uid = req.query.uid || 0;
  let role = req.query.role === 'publisher' ? RtcRole.PUBLISHER : RtcRole.SUBSCRIBER;
  let expireTime = parseInt(req.query.expireTime, 10) || 3600;

  const currentTime = Math.floor(Date.now() / 1000);
  const privilegeExpireTime = currentTime + expireTime;

  const token = RtcTokenBuilder.buildTokenWithUid(APP_ID, APP_CERTIFICATE, channelName, uid, role, privilegeExpireTime);

  return resp.json({ 'token': token });
};

app.get('/access_token', nocache, generateAccessToken);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log('Server is listening on port ' + PORT);
});
