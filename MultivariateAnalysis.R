library(MultBiplotR)

# Cargar los datos Protein
data("Protein")
str(Protein)
# Vector de medias
numeric_columns <- sapply(Protein, is.numeric)
mean_vector <- colMeans(Protein[, numeric_columns])
mean_vector
# Calcular la matriz de covarianzas
cov_matrix <- cov(numeric_data)
cov_matrix
# Calcular la media de las variables numéricas por región
mean_by_region <- aggregate(Protein[, numeric_columns], 
                            by = list(Region = Protein$Region), 
                            FUN = mean)

# Mostrar el resultado
mean_by_region
# Gráfico de estrellas
Sys.setlocale("LC_ALL", "es_ES.UTF-8")
stars(Protein[, numeric_columns], 
      labels = rownames(Protein), 
      main = "Gráfico de Estrellas para el Consumo de Proteínas en Europa",
      full = TRUE, # Las estrellas se llenan completamente (en lugar de una mitad)
      flip.labels = FALSE, # No se invierten las etiquetas
      draw.segments = TRUE) # Segmentos visibles entre variables
# Instalar y cargar el paquete aplpack para las Caras de Chernoff
if (!require(aplpack)) install.packages("aplpack", dependencies = TRUE)
## Cargando paquete requerido: aplpack
library(aplpack)

# Gráfico de caras de Chernoff
faces(Protein[, numeric_columns], 
      labels = rownames(Protein), 
      main = "Caras de Chernoff para el Consumo de Proteínas en Europa")
# Instalar y cargar el paquete MVN para pruebas de normalidad multivariada
if (!require(MVN)) install.packages("MVN", dependencies = TRUE)
library(MVN)

# Seleccionar solo las columnas numéricas
numeric_data <- Protein[, sapply(Protein, is.numeric)]

# Gráfico Q-Q de normalidad multivariada
mvn_result <- mvn(data = numeric_data, mvnTest = "royston", multivariatePlot = "qq")
# Seleccionar solo las columnas numéricas del dataset Protein
numeric_data <- Protein[, sapply(Protein, is.numeric)]

# Realizar la prueba de Mardia
mardia_test <- mvn(data = numeric_data, mvnTest = "mardia")

# Mostrar los resultados de la prueba
print(mardia_test$multivariateNormality)
# Seleccionar solo las columnas numéricas del dataset Protein
numeric_data <- Protein[, sapply(Protein, is.numeric)]

# Calcular las distancias de Mahalanobis y realizar la prueba de outliers multivariados
outliers_test <- mvn(data = numeric_data, multivariateOutlierMethod = "quan")
# Cargar los datos
data("Protein", package = "MultBiplotR")
numeric_data <- Protein[, sapply(Protein, is.numeric)]

# Definir las medias hipotéticas
mu0 <- c(9, 7, 2, 15, 5, 30, 4, 3, 4)
# Inicializar una lista para guardar los resultados
t_test_results <- list()

# Realizar pruebas t para cada variable
for (i in seq_along(numeric_data)) {
  var_name <- colnames(numeric_data)[i]
  t_test <- t.test(numeric_data[[i]], mu = mu0[i])
  t_test_results[[var_name]] <- t_test
}

# Mostrar resultados de las pruebas t
for (var_name in names(t_test_results)) {
  cat("Variable:", var_name, "\n")
  print(t_test_results[[var_name]])
  cat("\n\n")
}
num_vars <- ncol(numeric_data)
cat("Número de variables en numeric_data:", num_vars, "\n")

mu_0 <- c(9, 7, 2, 15, 5, 30, 4, 3, 4)

# Convertir mu_0 a un vector columna
mu_0 <- matrix(mu_0, ncol = 1)

# Función para calcular el estadístico T² de Hotelling
T2 <- function(X, mu, n) {
  Xbarra <- colMeans(X)
  Xbarra <- matrix(Xbarra, ncol = 1) # Convertir a vector columna
  S <- cov(X)
  InvS <- solve(S)
  DifMed <- Xbarra - mu
  T2 <- n * t(DifMed) %*% InvS %*% DifMed
  return(T2)
}

# Número de variables y tamaño de la muestra
p <- num_vars
n <- nrow(numeric_data)

# Calcular el estadístico T² de Hotelling
T2_statistic <- T2(numeric_data, mu_0, n)
cat("Hotelling's T² statistic:", T2_statistic, "\n")

# Calcular el valor crítico de la distribución F
qf <- qf(0.10, p, n - p, lower.tail = FALSE)
V <- (((n - 1) * p) / (n - p)) * qf
cat("Critical value from F-distribution:", qf, "\n")

cat("Scaled critical value V:", V, "\n")

