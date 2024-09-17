using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_PreguntadORT.Models;

namespace TP07_PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        return ConfigurarJuego();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        return RedirectToAction("Jugar");
    }

    public IActionResult Jugar()
    {
        Pregunta PreguntaElegida=Juego.ObtenerProximaPregunta();
        if(PreguntaElegida==null)
        {
            return RedirectToAction("FinalJuego");
        }
        else return RedirectToAction("Preguntas", PreguntaElegida);
    }

    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.EsCorrecta = Juego.VerificarRespuesta(idRespuesta);
        return View("Respuesta");
    }
}
