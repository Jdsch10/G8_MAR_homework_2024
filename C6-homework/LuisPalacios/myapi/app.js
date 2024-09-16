const express = require('express');
const { movies, directors } = require("./data");

const app = express();
const port = 3000;

app.use(express.json());

// --------------------- Rutas para Películas ---------------------

// Obtener todas las películas
app.get('/movies', (req, res) => {
  res.json(movies);
});

// Obtener una película por ID
app.get('/movies/:id', (req, res) => {
  const movie = movies.find(m => m.id === parseInt(req.params.id));
  if (!movie) return res.status(404).send('Movie not found');
  res.json(movie);
});

// Crear una nueva película
app.post('/movies', (req, res) => {
  if (!req.body.title || !req.body.directorId || !req.body.genre || !req.body.releaseYear) {
    return res.status(400).send('All fields are required');
  }

  const movie = {
    id: movies.length + 1,
    title: req.body.title,
    directorId: req.body.directorId,
    genre: req.body.genre,
    releaseYear: req.body.releaseYear
  };
  
  movies.push(movie);
  res.status(201).json(movie);
});

// Actualizar una película por ID
app.put('/movies/:id', (req, res) => {
  const movie = movies.find(m => m.id === parseInt(req.params.id));
  if (!movie) return res.status(404).send('Movie not found');

  movie.title = req.body.title;
  movie.directorId = req.body.directorId;
  movie.genre = req.body.genre;
  movie.releaseYear = req.body.releaseYear;

  res.json(movie);
});

// Eliminar una película por ID
app.delete('/movies/:id', (req, res) => {
  const movieIndex = movies.findIndex(m => m.id === parseInt(req.params.id));
  if (movieIndex === -1) return res.status(404).send('Movie not found');

  const deletedMovie = movies.splice(movieIndex, 1);
  res.json(deletedMovie[0]);
});

// --------------------- Rutas para Directores ---------------------

// Obtener todos los directores
app.get('/directors', (req, res) => {
  res.json(directors);
});

// Obtener un director por ID
app.get('/directors/:id', (req, res) => {
  const director = directors.find(d => d.id === parseInt(req.params.id));
  if (!director) return res.status(404).send('Director not found');
  res.json(director);
});

// Crear un nuevo director
app.post('/directors', (req, res) => {
  if (!req.body.name || !req.body.nationality) {
    return res.status(400).send('All fields are required');
  }

  const director = {
    id: directors.length + 1,
    name: req.body.name,
    nationality: req.body.nationality
  };
  
  directors.push(director);
  res.status(201).json(director);
});

// Actualizar un director por ID
app.put('/directors/:id', (req, res) => {
  const director = directors.find(d => d.id === parseInt(req.params.id));
  if (!director) return res.status(404).send('Director not found');

  director.name = req.body.name;
  director.nationality = req.body.nationality;

  res.json(director);
});

// Eliminar un director por ID
app.delete('/directors/:id', (req, res) => {
  const directorIndex = directors.findIndex(d => d.id === parseInt(req.params.id));
  if (directorIndex === -1) return res.status(404).send('Director not found');

  const deletedDirector = directors.splice(directorIndex, 1);
  res.json(deletedDirector[0]);
});

// --------------------- Iniciar el Servidor ---------------------

app.listen(port, () => {
  console.log(`listening on port ${port}`);
});
