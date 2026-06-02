$path = 'c:\Users\javie\Desktop\javaScip a base de datos\InsertarAutor.java'
$text = Get-Content $path -Raw
$text = $text -replace 'Integer idGenerado = clavesGeneradas.getInt\(1\);', 'Integer idGenerado = clavesGeneradas.getInt(1);\r\n\t\t\t\t\t\tautorId = idGenerado;'
$pattern = "\r?\n\t\t\t\t\}\r?\n\r?\n\t\t\t\}\s*catch \(SQLException e\) \{"
$replacement = "\r\n\t\t\t\t\tif (autorId != null) {\r\n\t\t\t\t\t\ttry (PreparedStatement sentenciaObra = conexion.prepareStatement(sqlInsertarobra)) {\r\n\t\t\t\t\t\t\tsentenciaObra.setString(1, titulo);\r\n\t\t\t\t\t\t\tsentenciaObra.setInt(2, añoDePublicación);\r\n\t\t\t\t\t\t\tsentenciaObra.setInt(3, autorId);\r\n\t\t\t\t\t\t\tsentenciaObra.executeUpdate();\r\n\t\t\t\t\t\t\tSystem.out.println(\"Obra insertada correctamente.\");\r\n\t\t\t\t\t\t} catch (SQLException e) {\r\n\t\t\t\t\t\t\tSystem.err.println(\"Error al insertar la obra:\");\r\n\t\t\t\t\t\t\tSystem.err.println(e.getMessage());\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t} else {\r\n\t\t\t\t\t\tSystem.err.println(\"No se pudo obtener el ID del autor. No se insertó la obra.\");\r\n\t\t\t\t\t}\r\n\t\t\t\t}\r\n\r\n\t\t\t} catch (SQLException e) {"
$newText = [regex]::Replace($text, $pattern, $replacement, [System.Text.RegularExpressions.RegexOptions]::Singleline)
Set-Content -Path $path -Value $newText -Encoding UTF8
Write-Host 'Script completed'
