# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create admin user if none exists
unless AdminUser.exists?(email: 'admin@example.com')
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
end

# Clear existing gods
BxBlockGod::God.destroy_all

puts "Creating Hindu Gods data..."

# Trimurti (Major Gods)
gods_data = [
  {
    name: "Brahma",
    sanskrit_name: "ब्रह्मा",
    role: "major",
    category: "trimurti",
    description: "The creator of the universe and all beings. One of the Trimurti, representing creation.",
    significance: "Brahma is the creator of the universe and all beings. He is often depicted with four heads, representing the four Vedas.",
    festivals: "Brahmotsavam",
    temples: "Pushkar Brahma Temple, Rajasthan",
    mantras: "Om Brahmaya Namah",
    image_url: "https://example.com/brahma.jpg"
  },
  {
    name: "Vishnu",
    sanskrit_name: "विष्णु",
    role: "major",
    category: "trimurti",
    description: "The preserver of the universe. One of the Trimurti, representing maintenance and protection.",
    significance: "Vishnu is the preserver of the universe and maintains cosmic order. He takes various avatars to protect dharma.",
    festivals: "Vaikuntha Ekadashi, Rama Navami, Krishna Janmashtami",
    temples: "Tirupati Balaji, Badrinath Temple",
    mantras: "Om Namo Narayanaya",
    image_url: "https://example.com/vishnu.jpg"
  },
  {
    name: "Shiva",
    sanskrit_name: "शिव",
    role: "major",
    category: "trimurti",
    description: "The destroyer and transformer. One of the Trimurti, representing destruction and regeneration.",
    significance: "Shiva is the destroyer of evil and the transformer. He represents the cycle of creation and destruction.",
    festivals: "Maha Shivaratri, Shravan month",
    temples: "Kedarnath, Somnath, Kashi Vishwanath",
    mantras: "Om Namah Shivaya",
    image_url: "https://example.com/shiva.jpg"
  }
]

# Tridevi (Consorts)
tridevi_data = [
  {
    name: "Saraswati",
    sanskrit_name: "सरस्वती",
    role: "major",
    category: "tridevi",
    consort_of: "Brahma",
    description: "Goddess of knowledge, music, arts, wisdom, and learning.",
    significance: "Saraswati is the embodiment of knowledge and wisdom. She is the patron of arts and learning.",
    festivals: "Vasant Panchami, Saraswati Puja",
    temples: "Shringeri Sharadamba Temple, Basar Saraswati Temple",
    mantras: "Om Aim Saraswatyai Namah",
    image_url: "https://example.com/saraswati.jpg"
  },
  {
    name: "Lakshmi",
    sanskrit_name: "लक्ष्मी",
    role: "major",
    category: "tridevi",
    consort_of: "Vishnu",
    description: "Goddess of wealth, fortune, and prosperity.",
    significance: "Lakshmi is the goddess of wealth and prosperity. She brings good fortune and abundance.",
    festivals: "Diwali, Varalakshmi Vratam",
    temples: "Mahalakshmi Temple, Kolhapur",
    mantras: "Om Shreem Mahalakshmiyei Namah",
    image_url: "https://example.com/lakshmi.jpg"
  },
  {
    name: "Parvati",
    sanskrit_name: "पार्वती",
    role: "major",
    category: "tridevi",
    consort_of: "Shiva",
    description: "Goddess of power, love, and devotion.",
    significance: "Parvati is the gentle aspect of Shakti. She represents love, devotion, and marital bliss.",
    festivals: "Teej, Gauri Puja",
    temples: "Kamakhya Temple, Meenakshi Temple",
    mantras: "Om Parvatyai Namah",
    image_url: "https://example.com/parvati.jpg"
  }
]

# Popular Deities
popular_deities_data = [
  {
    name: "Hanuman",
    sanskrit_name: "हनुमान",
    role: "major",
    category: "devotion",
    description: "The divine monkey god, known for his devotion to Lord Rama.",
    significance: "Hanuman is the embodiment of devotion, strength, and loyalty. He is known for his unwavering devotion to Lord Rama.",
    festivals: "Hanuman Jayanti",
    temples: "Sankat Mochan Hanuman Temple, Jakhu Temple",
    mantras: "Om Hanumate Rudratmakaya Hum Phat",
    image_url: "https://example.com/hanuman.jpg"
  },
  {
    name: "Ganesha",
    sanskrit_name: "गणेश",
    role: "major",
    category: "devotion",
    description: "The elephant-headed god, remover of obstacles and god of wisdom.",
    significance: "Ganesha is the remover of obstacles and the god of wisdom. He is worshipped before starting any new venture.",
    festivals: "Ganesh Chaturthi",
    temples: "Siddhivinayak Temple, Ashtavinayak Temples",
    mantras: "Om Gan Ganpataye Namo Namah",
    image_url: "https://example.com/ganesha.jpg"
  },
  {
    name: "Durga",
    sanskrit_name: "दुर्गा",
    role: "major",
    category: "devotion",
    description: "The warrior form of Parvati, slayer of demons.",
    significance: "Durga is the warrior form of Parvati. She represents the power of good over evil.",
    festivals: "Durga Puja, Navaratri",
    temples: "Dakshineswar Kali Temple, Vaishno Devi",
    mantras: "Om Dum Durgayei Namaha",
    image_url: "https://example.com/durga.jpg"
  },
  {
    name: "Kali",
    sanskrit_name: "काली",
    role: "major",
    category: "devotion",
    description: "The fierce form of Shakti, destroyer of evil.",
    significance: "Kali is the fierce form of Shakti. She represents the power of time and destruction of evil.",
    festivals: "Kali Puja",
    temples: "Kalighat Temple, Dakshineswar Kali Temple",
    mantras: "Om Krim Kalikayai Namah",
    image_url: "https://example.com/kali.jpg"
  },
  {
    name: "Murugan",
    sanskrit_name: "मुरुगन",
    role: "major",
    category: "devotion",
    description: "The Tamil god of war, son of Shiva and Parvati.",
    significance: "Murugan is the god of war and victory. He is particularly worshipped in South India.",
    festivals: "Thaipusam, Skanda Shashti",
    temples: "Palani Murugan Temple, Thiruchendur Murugan Temple",
    mantras: "Om Saravanabhava",
    image_url: "https://example.com/murugan.jpg"
  },
  {
    name: "Surya",
    sanskrit_name: "सूर्य",
    role: "major",
    category: "devotion",
    description: "The sun god, source of light and life.",
    significance: "Surya is the sun god and the source of light and life. He is worshipped for health and vitality.",
    festivals: "Chhath Puja, Ratha Saptami",
    temples: "Konark Sun Temple, Modhera Sun Temple",
    mantras: "Om Hrim Hrim Suryaya Namah",
    image_url: "https://example.com/surya.jpg"
  }
]

# Create all gods
all_gods = gods_data + tridevi_data + popular_deities_data
all_gods.each do |god_data|
  god = BxBlockGod::God.create!(god_data)
  puts "Created Hindu God: #{god.name}"
end

# Add bhajans for some gods
def add_bhajans(god, bhajans_data)
  bhajans_data.each do |bhajan_type, text|
    god.bhajans.create!(bhajan_type: bhajan_type, text: text)
  end
end

# Add bhajans for Hanuman
hanuman = BxBlockGod::God.find_by(name: 'Hanuman')
if hanuman
  add_bhajans(hanuman, {
    arti: "जय हनुमान ज्ञान गुन सागर
जय कपीस तिहुँ लोक उजागर
राम दूत अतुलित बल धामा
अंजनि-पुत्र पवनसुत नामा
महाबीर बिक्रम बजरंगी
कुमति निवार सुमति के संगी
कंचन बरन बिराज सुबेसा
कानन कुंडल कुंचित केसा
हाथ बज्र औ ध्वजा बिराजै
काँधे मूँज जनेऊ साजै
शंकर सुवन केसरीनंदन
तेज प्रताप महा जग बंदन
विद्यावान गुनी अति चातुर
राम काज करिबे को आतुर
प्रभु चरित्र सुनिबे को रसिया
राम लखन सीता मन बसिया
सूक्ष्म रूप धरि सियहिं दिखावा
बिकट रूप धरि लंक जरावा
भीम रूप धरि असुर संहारे
रामचंद्र के काज संवारे
लाय सजीवन लखन जियाये
श्रीरघुबीर हरषि उर लाये
रघुपति कीन्ही बहुत बड़ाई
तुम मम प्रिय भरतहि सम भाई
सहस बदन तुम्हरो जस गावैं
अस कहि श्रीपति कंठ लगावैं
सनकादिक ब्रह्मादि मुनीसा
नारद सारद सहित अहीसा
जम कुबेर दिगपाल जहाँ ते
कवि कोविद कहि सके कहाँ ते
तुम उपकार सुग्रीवहिं कीन्हा
राम मिलाय राज पद दीन्हा
तुम्हरो मंत्र बिभीषण माना
लंकेस्वर भए सब जग जाना
जुग सहस्र जोजन पर भानू
लील्यो ताहि मधुर फल जानू
प्रभु मुद्रिका मेलि मुख माहीं
जलधि लांघि गये अचरज नाहीं
दुर्गम काज जगत के जेते
सुगम अनुग्रह तुम्हरे तेते
राम दुआरे तुम रखवारे
होत न आज्ञा बिनु पैसारे
सब सुख लहै तुम्हारी सरना
तुम रक्षक काहू को डरना
आपन तेज सम्हारो आपै
तीनों लोक हांक तें कांपै
भूत पिशाच निकट नहिं आवै
महाबीर जब नाम सुनावै
नासै रोग हरै सब पीरा
जपत निरंतर हनुमत बीरा
संकट तें हनुमान छुड़ावै
मन क्रम बचन ध्यान जो लावै
सब पर राम तपस्वी राजा
तिन के काज सकल तुम साजा
और मनोरथ जो कोई लावै
सोई अमित जीवन फल पावै
चारों जुग परताप तुम्हारा
है परसिद्ध जगत उजियारा
साधु-संत के तुम रखवारे
असुर निकंदन राम दुलारे
अष्ट सिद्धि नौ निधि के दाता
अस बर दीन जानकी माता
राम रसायन तुम्हरे पासा
सदा रहो रघुपति के दासा
तुम्हरे भजन राम को पावै
जनम-जनम के दुख बिसरावै
अंतकाल रघुबर पुर जाई
जहां जन्म हरि-भक्त कहाई
और देवता चित्त न धरई
हनुमत सेई सर्व सुख करई
संकट कटै मिटै सब पीरा
जो सुमिरै हनुमत बलबीरा
जै जै जै हनुमान गोसाईं
कृपा करहु गुरुदेव की नाईं
जो सत बार पाठ कर कोई
छूटहि बंदि महा सुख होई
जो यह पढ़ै हनुमान चालीसा
होय सिद्धि साखी गौरीसा
तुलसीदास सदा हरि चेरा
कीजै नाथ हृदय मँह डेरा",
    chalisa: "दोहा
श्रीगुरु चरन सरोज रज, निज मन मुकुर सुधारि।
बरनऊं रघुबर बिमल जसु, जो दायकु फल चारि॥
बुद्धिहीन तनु जानिके, सुमिरौं पवन-कुमार।
बल बुधि बिद्या देहु मोहिं, हरहु कलेस बिकार॥

चौपाई
जय हनुमान ज्ञान गुन सागर।
जय कपीस तिहुं लोक उजागर॥
राम दूत अतुलित बल धामा।
अंजनि-पुत्र पवनसुत नामा॥
महाबीर बिक्रम बजरंगी।
कुमति निवार सुमति के संगी॥
कंचन बरन बिराज सुबेसा।
कानन कुंडल कुंचित केसा॥
हाथ बज्र औ ध्वजा बिराजै।
कांधे मूंज जनेऊ साजै॥
शंकर सुवन केसरीनंदन।
तेज प्रताप महा जग बंदन॥
विद्यावान गुनी अति चातुर।
राम काज करिबे को आतुर॥
प्रभु चरित्र सुनिबे को रसिया।
राम लखन सीता मन बसिया॥
सूक्ष्म रूप धरि सियहिं दिखावा।
बिकट रूप धरि लंक जरावा॥
भीम रूप धरि असुर संहारे।
रामचंद्र के काज संवारे॥
लाय सजीवन लखन जियाये।
श्रीरघुबीर हरषि उर लाये॥
रघुपति कीन्ही बहुत बड़ाई।
तुम मम प्रिय भरतहि सम भाई॥
सहस बदन तुम्हरो जस गावैं।
अस कहि श्रीपति कंठ लगावैं॥
सनकादिक ब्रह्मादि मुनीसा।
नारद सारद सहित अहीसा॥
जम कुबेर दिगपाल जहां ते।
कवि कोविद कहि सके कहां ते॥
तुम उपकार सुग्रीवहिं कीन्हा।
राम मिलाय राज पद दीन्हा॥
तुम्हरो मंत्र बिभीषण माना।
लंकेस्वर भए सब जग जाना॥
जुग सहस्र जोजन पर भानू।
लील्यो ताहि मधुर फल जानू॥
प्रभु मुद्रिका मेलि मुख माहीं।
जलधि लांघि गये अचरज नाहीं॥
दुर्गम काज जगत के जेते।
सुगम अनुग्रह तुम्हरे तेते॥
राम दुआरे तुम रखवारे।
होत न आज्ञा बिनु पैसारे॥
सब सुख लहै तुम्हारी सरना।
तुम रक्षक काहू को डरना॥
आपन तेज सम्हारो आपै।
तीनों लोक हांक तें कांपै॥
भूत पिशाच निकट नहिं आवै।
महाबीर जब नाम सुनावै॥
नासै रोग हरै सब पीरा।
जपत निरंतर हनुमत बीरा॥
संकट तें हनुमान छुड़ावै।
मन क्रम बचन ध्यान जो लावै॥
सब पर राम तपस्वी राजा।
तिन के काज सकल तुम साजा॥
और मनोरथ जो कोई लावै।
सोई अमित जीवन फल पावै॥
चारों जुग परताप तुम्हारा।
है परसिद्ध जगत उजियारा॥
साधु-संत के तुम रखवारे।
असुर निकंदन राम दुलारे॥
अष्ट सिद्धि नौ निधि के दाता।
अस बर दीन जानकी माता॥
राम रसायन तुम्हरे पासा।
सदा रहो रघुपति के दासा॥
तुम्हरे भजन राम को पावै।
जनम-जनम के दुख बिसरावै॥
अंतकाल रघुबर पुर जाई।
जहां जन्म हरि-भक्त कहाई॥
और देवता चित्त न धरई।
हनुमत सेई सर्व सुख करई॥
संकट कटै मिटै सब पीरा।
जो सुमिरै हनुमत बलबीरा॥
जै जै जै हनुमान गोसाईं।
कृपा करहु गुरुदेव की नाईं॥
जो सत बार पाठ कर कोई।
छूटहि बंदि महा सुख होई॥
जो यह पढ़ै हनुमान चालीसा।
होय सिद्धि साखी गौरीसा॥
तुलसीदास सदा हरि चेरा।
कीजै नाथ हृदय मँह डेरा॥"
  })
end

# Add bhajans for Shiva
shiva = BxBlockGod::God.find_by(name: 'Shiva')
if shiva
  add_bhajans(shiva, {
    arti: "ॐ जय शिव ओंकारा, प्रभु जय शिव ओंकारा
ब्रह्मा विष्णु सदाशिव, अर्धांगी धारा
एकानन चतुरानन पंचानन राजे
हंसासन गरूड़ासन वृषवाहन साजे
दो भुज चार चतुर्भुज दस भुज अति सोहे
तीनों रूप निरखते त्रिभुवन जन मोहे
अक्षमाला वनमाला मुण्डमाला धारी
चंदन मृगमद सोहै भाले शशिधारी
श्वेताम्बर पीताम्बर बाघम्बर अंगा
सनकादिक गरुणादिक भूतादिक संगा
कर के मध्य कमंडल चक्र त्रिशूलधारी
सुखकारी दुखहारी जगपालन कारी
ब्रह्मा विष्णु सदाशिव जानत अविवेका
प्रणवाक्षर मध्ये ये तीनों एका
त्रिगुण स्वामी की आरती जो कोई नर गावे
कहत शिवानंद स्वामी मनवांछित फल पावे",
    stotram: "कर्पूरगौरं करुणावतारं संसारसारं भुजगेन्द्रहारम्।
सदा वसन्तं हृदयारविन्दे भवं भवानीसहितं नमामि॥"
  })
end

# Add bhajans for Krishna
krishna = BxBlockGod::God.find_by(name: 'Krishna')
if krishna
  add_bhajans(krishna, {
    arti: "जय श्री कृष्णा, जय श्री कृष्णा
जय श्री कृष्णा, जय श्री कृष्णा
जय श्री कृष्णा, जय श्री कृष्णा
जय श्री कृष्णा, जय श्री कृष्णा

कान्हा तेरी बंसी बड़ी मीठी
कान्हा तेरी बंसी बड़ी मीठी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी

कान्हा तेरी बंसी बड़ी मीठी
कान्हा तेरी बंसी बड़ी मीठी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी

कान्हा तेरी बंसी बड़ी मीठी
कान्हा तेरी बंसी बड़ी मीठी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी
मीठी तेरी बंसी, मीठी तेरी बंसी",
    bhajan: "हरे कृष्ण हरे राम
हरे राम हरे राम
राम राम हरे हरे
हरे कृष्ण हरे राम"
  })
end

puts "Seed data created successfully!"