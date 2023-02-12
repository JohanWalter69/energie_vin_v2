require "open-uri"
require "nokogiri"

User.destroy_all
Product.destroy_all
Review.destroy_all

john = User.create!(
  password: 'secret',
  email: 'john@gmail.com',
  expert: true
)

# Version avec scraping de la page téléchargée en local
filepath = "/home/johan/code/energie_vin/results.html"
# 1. On obtient le contenu de la page HTML
html_content = File.open(filepath)
# 2. On crée un document Nokogiri à partir de ce fichier
doc = Nokogiri::HTML.parse(html_content)

# Version scraping online
# url = 'https://www.wineandco.com/vins'
# html_content = URI.open(url)
# doc = Nokogiri::HTML.parse(html_content)
@g_products = []

doc.search('.c-wine').first(5).each do |element|
  name = element.search(".name").text.strip
  image_url = element.search('.c-wine__picture__img').children[1].attr('src')

  origin = element.search('.city').text.strip
  price = element.search('.price').children.text.strip

  # On récupère les informations suivantes sur la page de détails du produit
  product_link = element.children[1].attr('href')
  html_product_file = URI.open(product_link).read
  product_doc = Nokogiri::HTML.parse(html_product_file)

  description = product_doc.search('.c-product-description__text').children[1].text.strip
  category = product_doc.search('.l-product__infos__city').children[1].text.strip

  # Si aucune note n'existe sur le site source, on vient attribuer une note aléatoire
  if product_doc.search('.l-product__infos__avis').children[3].nil?
    rate = rand(3..5)
  else
    rate = product_doc.search('.l-product__infos__avis').children[3].text[0]
  end

  @g_products << Product.create!(
    name: name,
    description: description,
    category: category,
    origin: origin,
    price: price,
    image_url: image_url,
    rate: rate
  )
end

# Pour chaque produit crée une revue d'expert est attribué / à développer
@g_products.each do |product|
  Review.create!(
    rate: rand(1..5),
    user: john,
    product: product
  )
end

# Seed initiale créée pour le développement du parcours utilisateur
# 5.times do
#   white_wine = Product.create!(
#     name: 'Vin du jura',
#     description: 'Excellent vin',
#     category: 'vin blanc',
#     origin: 'jura',
#     price: rand(10..30),
#     image_url: '/assets/vin_jaune.jpg',
#     rate: rand(2..5)
#   )

#   red_wine = Product.create!(
#     name: 'Vin du jura',
#     description: 'Excellent vin',
#     category: 'vin rouge',
#     origin: 'bordeaux',
#     price: rand(10..30),
#     image_url: '/assets/red_wine.jpg',
#     rate: rand(2..5)
#   )

#   rose_wine = Product.create!(
#     name: 'Rosé de provence',
#     description: 'Excellent vin',
#     category: 'vin rosé',
#     origin: 'languedoc',
#     price: rand(10..30),
#     image_url: '/assets/rose_wine.jpg',
#     rate: rand(2..5)
#   )

#   5.times do
#     review = Review.create!(
#       rate: rand(1..5),
#       user: john,
#       product: white_wine
#     )
#     review2 = Review.create!(
#       rate: rand(1..5),
#       user: john,
#       product: red_wine
#     )

#     review3 = Review.create!(
#       rate: rand(1..5),
#       user: john,
#       product: rose_wine
#     )
#   end
# end
