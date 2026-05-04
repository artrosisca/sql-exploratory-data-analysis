--explorando os dados de clientes, quero saber quais países estão representados na tabela de clientes.
SELECT DISTINCT country FROM gold.dim_customers

-- Quero saber quais categorias de produtos estão representadas na tabela de produtos. Em seguida, quero saber quais subcategorias estão representadas em cada categoria. E por fim, quero saber quais produtos estão representados em cada subcategoria.
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3