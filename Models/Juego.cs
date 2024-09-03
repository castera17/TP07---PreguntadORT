public static class Juego{
public static string username {get; set;}
public static int PuntajeActual {get;set;}
public static int CantidadPreguntasCorrectas {get; set;}
public static int ContadorNoPreguntaActual {get; set;}
public static Pregunta PreguntaActual {get; set;}
public static List<Pregunta> ListaPreguntas {get; set;}
public static List<Respuesta> ListaRespuestas {get; set;}

static Juego(){

}
}