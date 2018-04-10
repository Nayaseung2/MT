module.exports = function(app, streams) {

	// GET home 
	var index = function(req, res) {
		res.render('index', { 
			title: '연습 RTC', 
			header: '실시간 웹방송',
			username: 'Username',
			share: '실시간방송주소',
			footer: 'bj 심성보',
			id: req.params.id
		});
	}; 
	var index2 = function(req, res) {
		res.render('index2', { 
			title: '연습 RTC', 
			header: '실시간 웹방송',
			username: 'Username',
			share: '실시간방송주소',
			footer: 'bj 심성보',
			id: req.params.id
		});
	};

	// GET streams as JSON
	var displayStreams = function(req, res) {
		var streamList = streams.getStreams();
		// JSON exploit to clone streamList.public
		var data = (JSON.parse(JSON.stringify(streamList))); 

		res.status(200).json(data);
	};

	app.get('/streams.json', displayStreams);
	app.get('/', index);
	app.get('/:id', index2);
}