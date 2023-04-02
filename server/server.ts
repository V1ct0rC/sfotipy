import express = require('express');
import bodyParser = require("body-parser");
import { PlaylistService } from './src/playlist-service';

var app = express();

var playlistService = new PlaylistService();

var allowCrossDomain = function(req: any, res: any, next: any) {
  res.header('Access-Control-Allow-Origin', "*");
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  next();
}

app.use(allowCrossDomain);

app.use(bodyParser.json());

app.get('/playlist-em-alta', function(req, res){
  const plstEa = playlistService.getEA();
  res.send(JSON.stringify(plstEa));
})

app.get('/playlist-publica', function(req, res){
  const plstEa = playlistService.getPB();
  res.send(JSON.stringify(plstEa));
})

app.get('/playlist-recomendada', function(req, res){
  const plstEa = playlistService.getRC();
  res.send(JSON.stringify(plstEa));
})

app.get('/playlist-minha', function(req, res){
  const plstEa = playlistService.getMN();
  res.send(JSON.stringify(plstEa));
})

var server = app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

function closeServer(): void {
  server.close();
}

export { app, server, closeServer }

/*
import { CarService } from './src/cars-service';
import { Car } from './src/car';

var app = express();

var allowCrossDomain = function(req: any, res: any, next: any) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}
app.use(allowCrossDomain);

app.use(bodyParser.json());

var carService: CarService = new CarService();

app.get('/cars', function(req, res){
  const cars = carService.get();
  res.send(JSON.stringify(cars));
});

app.get('/cars/:id', function(req, res){
  const id = req.params.id;
  const car = carService.getById(id);
  if (car) {
    res.send(car);
  } else {
    res.status(404).send({ message: `Car ${id} could not be found`});
  }
});

app.post('/cars', function(req: express.Request, res: express.Response){
  const car: Car = <Car> req.body;
  try {
    const result = carService.add(car);
    if (result) {
      res.status(201).send(result);
    } else {
      res.status(403).send({ message: "Car list is full"});
    }
  } catch (err) {
    const {message} = err;
    res.status(400).send({ message })
  }
});

app.put('/cars', function (req: express.Request, res: express.Response) {
  const car: Car = <Car> req.body;
  const result = carService.update(car);
  if (result) {
    res.send(result);
  } else {
    res.status(404).send({ message: `Car ${car.id} could not be found.`});
  }
})

var server = app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

function closeServer(): void {
  server.close();
}

export { app, server, closeServer }
*/