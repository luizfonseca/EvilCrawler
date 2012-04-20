#coding: utf-8
['rubygems', 'open-uri', 'nokogiri', 'mechanize'].each { |s| require s }

entities = [
  'Secretaria Municipal da Casa Civil',
  'Secretaria Municipal de Obras',
  'Secretaria Municipal de Transportes',
  'Secretaria Municipal de Administração',
  'Secretaria Municipal de Urbanismo',
  'Secretaria Municipal de Fazenda',
  'Secretaria Municipal de Assistência Social',
  'Secretaria Municipal de Esportes e Lazer',
  'Secretaria Municipal de Cultura',
  'Secretaria Municipal da Pessoa com Deficiência',
  'Secretaria Especial de Envelhecimento Saudável e Qualidade de Vida',
  'Secretaria Especial de Desenvolvimento Econômico Solidário',
  'Secretaria Especial de Promoção e Defesa dos Animais',
  'Secretaria Especial de Ciência e Tecnologia',
  'Secretaria Extraordinária de Desenvolvimento',
  'Secretaria Municipal de Conservação',
  'Secretaria Municipal do Trabalho e Emprego',
  'Secretaria Municipal de Habitação',
  'Secretaria Municipal de Educação',
].collect { |x| x.gsub(/ /, '_') + "_do_Rio_de_Janeiro" }

url = "http://pt.wikipedia.org/wiki/"

entities.each do |query|

  begin
    document = Nokogiri::HTML(open("#{url}#{query}"))
    result = document.search('p').text
    result = result.match(/(secretária|secretário|secretáriaa) é? ([^"]*)/).captures[1]

    puts "#{query}: #{result} \n"
    puts "----------------------"
  rescue
    nil
  end

end


