namespace :gods do
  desc "Create sample gods for BxBlockGod"
  task create: :environment do
    # Create Ganesha
    BxBlockGod::God.find_or_create_by!(name: "Ganesha") do |god|
      god.sanskrit_name = "गणेश"
      god.description = "The elephant-headed god, known as the remover of obstacles and god of beginnings."
      god.significance = "Lord Ganesha is invoked before beginning any new venture or ritual."
      god.festivals = "Ganesh Chaturthi"
      god.temples = "Siddhivinayak Temple (Mumbai), Shri Mahaganapati Temple (Ranjangaon)"
      god.mantras = "Om Gam Ganapataye Namaha"
      god.image_url = "https://upload.wikimedia.org/wikipedia/commons/9/99/Ganesha_Basohli_miniature_circa_1730_Dubost_p73.jpg"
      puts "Created Hindu God: Ganesha"
    end

    # Create Shiva
    BxBlockGod::God.find_or_create_by!(name: "Shiva") do |god|
      god.sanskrit_name = "शिव"
      god.description = "The destroyer and transformer within the Trimurti, the Hindu trinity."
      god.significance = "Lord Shiva represents the cosmic functions of creation, maintenance, and destruction."
      god.festivals = "Maha Shivaratri"
      god.temples = "Kashi Vishwanath (Varanasi), Kedarnath Temple (Uttarakhand)"
      god.mantras = "Om Namah Shivaya"
      god.image_url = "https://upload.wikimedia.org/wikipedia/commons/f/f5/Shiva_as_the_Lord_of_Dance_LACMA_edit.jpg"
      puts "Created Hindu God: Shiva"
    end

    # Create Krishna
    BxBlockGod::God.find_or_create_by!(name: "Krishna") do |god|
      god.sanskrit_name = "कृष्ण"
      god.description = "The eighth avatar of Vishnu, known for his role in the Mahabharata and the Bhagavad Gita."
      god.significance = "Lord Krishna is revered as the teacher of the Bhagavad Gita and embodiment of divine love."
      god.festivals = "Janmashtami, Holi"
      god.temples = "Banke Bihari Temple (Vrindavan), Dwarkadhish Temple (Dwarka)"
      god.mantras = "Om Namo Bhagavate Vasudevaya"
      god.image_url = "https://upload.wikimedia.org/wikipedia/commons/2/2a/Krishna_with_flute.jpg"
      puts "Created Hindu God: Krishna"
    end
  end
end 