class Eleve

  attr_reader :nom

  def initialize(nom)
    @nom = nom
  end

  # Override la Class
  # def noms=(value)
  #   @nom = value.map {|v| v.downcase}
  #   super
  # end

  def comment_je_mappelle
    puts @nom
  end

  def maxime?
    @nom == 'Tom'
  end

  def afficher_les_eleves
    nom.each do |nom|
      puts nom
    end
  end

  def afficher_les_eleves_par_prenoms_et_noms
    nom.each_with_index do |index, nom|
      puts "Nom: #{nom}, #{prenom}"
    end
  end

end

nom = ['durand', 'hash', 'artcocucohur']
prenoms = ['maxime', 'cedric', 'arthur']
eleves = Eleve.new(nom_des_eleves)
eleve = Eleve.new("Tom")
eleve.comment_je_mappelle
puts eleve.maxime?
eleves.afficher_les_eleves