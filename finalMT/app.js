/**
 * Module dependencies.
 */
var express = require('express')
,	path = require('path')
,	streams = require('./app/streams.js')();

var favicon = require('serve-favicon')
,	logger = require('morgan')
,	methodOverride = require('method-override')
,	bodyParser = require('body-parser')
,	errorHandler = require('errorhandler');

var http =require('http'), 
	https =require('https'),
	fs = require('fs')

var options={ 
	key: fs.readFileSync('./keys/pri.pem'),
	cert: fs.readFileSync('./keys/pub.pem')
}

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(favicon(__dirname + '/public/images/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(methodOverride());
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(errorHandler()); 
}

// routing 
require('./app/routes.js')(app, streams);



var server = https.createServer(options,app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

var io = require('socket.io').listen(server);

//채팅창
io.on('connection', function(socket){ 
	socket.on('join:room', function(data) {
     socket.join('room' + data.roomId);
	 });
	 
	socket.on('user', function(data) { 
	 socket.in('room' + data.roomId).broadcast.emit('message',data);
	    /* socket.broadcast.to('room' + data.roomId).emit('message', data); */
			 
		 });
});


/**
 * Socket.io event handling
 */
require('./app/socketHandler.js')(io, streams);











