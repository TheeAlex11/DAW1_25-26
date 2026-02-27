import java.io.*; // JDK ESTANDAR
import javax.xml.parsers.*; // JDK ESTANDAR
import org.w3c.dom.*;

public class LeerXML {
    public static void main(String[] args) throws Exception {
        File ficheroXML = new File("datos/pelicula.xml");
        DocumentBuilderFactory factoria = DocumentBuilderFactory.newInstance();

        DocumentBuilder constructor = factoria.newDocumentBuilder();
        Document documento = constructor.parse(ficheroXML);

        Element raiz = documento.getDocumentElement();
        String titulo = raiz.getElementsByTagName("título").item(0).getTextContent();
        String director = raiz.getElementsByTagName("director").item(0).getTextContent();
        Integer ano = Integer.valueOf(raiz.getElementsByTagName("año").item(0).getTextContent());
        Integer duracion = Integer.valueOf(raiz.getElementsByTagName("duración").item(0).getTextContent());

        Pelicula peli = new Pelicula(titulo, director, ano, duracion);
        System.out.println(peli);
    }
}