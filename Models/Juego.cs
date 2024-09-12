namespace TP07_PreguntadORT;

public static class Juego
{
public static string username;
public static int PuntajeActual;
public static int CantidadPreguntasCorrectas;
public static int ContadorNoPreguntaActual;
public static Pregunta PreguntaActual;
public static List<Pregunta> ListaPreguntas = new List<Pregunta>();
public static List<Respuesta> ListaRespuestas = new List<Respuesta>();

private static void InicializarJuego()
    {
        username = string.Empty;
        PuntajeActual = 0;
        CantidadPreguntasCorrectas = 0;
        ContadorNoPreguntaActual = 0;
        PreguntaActual = null;
        ListaPreguntas = new List<Pregunta>();
        ListaRespuestas = new List<Respuesta>();
    }


public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

public static void CargarPartida(string user, int dificultad, int categoria)
    {
        InicializarJuego();
        username = user;
        ListaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);
    }

public static Pregunta ObtenerProximaPregunta()
    {
        if (ListaPreguntas.Count < ContadorNoPreguntaActual) 
        {
            PreguntaActual = ListaPreguntas[ContadorNoPreguntaActual];
            return PreguntaActual;
        }
        return null;
    }

public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        ListaRespuestas = BD.ObtenerRespuestas(idPregunta);
        return ListaRespuestas;
    }

public static bool VerificarRespuesta(int idRespuesta)
    {
        bool esCorrecta = BD.esCorrecta(idRespuesta);
        if (esCorrecta == true)
        {
            PuntajeActual += 10;
            CantidadPreguntasCorrectas++;
            esCorrecta = true;
        }
        CantidadPreguntasCorrectas++;
        if (ContadorNoPreguntaActual < ListaPreguntas.Count)
        {
            PreguntaActual = ListaPreguntas[ContadorNoPreguntaActual];
        }
        return esCorrecta;
    }
}