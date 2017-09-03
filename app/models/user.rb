class User < ApplicationRecord
  acts_as_taggable
  has_and_belongs_to_many :groups

  CITIES = ["Amsterdam", "Rotterdam", "Den Haag", "Utrecht", "Eindhoven", "Nijmegen", "Hilversum", "Groningen", "Haarlem", "Leiden", "Arnhem", "Delft", "Maastricht", "Almere", "Breda", "Amersfoort", "Amstelveen", "'s-Hertogenbosch", "Tilburg", "Alkmaar", "Enschede", "Zoetermeer", "Helmond", "Zwolle", "Leeuwarden", "Apeldoorn", "Venlo", "Hoorn", "Dordrecht", "Zaanstad", "Lelystad", "Wageningen", "Ede", "Rijswijk", "Gouda", "Nieuwegein", "Heerlen", "Haarlemmermeer", "Bussum", "Purmerend", "Doetinchem", "Zeist", "Hengelo", "Leidschendam-Voorburg", "Emmen", "Bergen op Zoom", "Roermond", "Deventer", "Schiedam", "Beverwijk", "Hardenberg", "Heerhugowaard", "Zutphen", "Culemborg", "Woerden", "Veldhoven", "Den Helder", "Wassenaar", "Voorschoten", "Huizen", "Heemskerk", "Goes", "Nuenen", "Roosendaal", "Oss", "Houten", "Diemen", "Weesp", "Zandvoort", "Almelo", "Alphen", "Assen", "Barneveld", "Soest", "De Bilt", "Dronten", "Terneuzen", "Meppel", "Aalsmeer", "Capelle", "Veenendaal", "Hoogeveen", "Middelburg", "Heemstede", "Vlaardingen", "Ridderkerk", "Maarssen", "IJsselstein", "Vught", "Baarn", "Noordwijk", "Oosterhout", "Kampen", "Heerenveen", "Uden", "Landgraaf", "Gorinchem", "Brunssum", "Oegstgeest", "Vianen", "Naarden", "Weert", "Tiel", "Hellevoetsluis", "Wijchen", "Stadskanaal", "Blaricum", "Deurne", "Oud-Beijerland", "Zeewolde", "Berkel en Rodenrijs", "Bloemendaal", "Spijkenisse", "Waalwijk", "Steenwijk", "Harderwijk", "Venray", "Barendrecht", "Pijnacker-Nootdorp", "Castricum", "Sneek", "Maassluis", "Bergen", "Boxtel", "Leusden", "Winterswijk", "Leiderdorp", "Nieuwekerk aan den IJssel", "Hendrik-Ido-Ambacht", "Lisse", "Hulst", "Enkhuizen", "Velsen", "Vlissingen", "Katwijk", "Laren", "Uitgeest", "De Ronde Venen", "Doorn", "Waddinxveen", "Uithoorn", "Dongen", "Leerdam", "Bodegraven", "Lichtenvoorde", "Lochem", "Schagen", "Waalre", "Brielle", "Breukelen", "Rheden", "Zwijndrecht", "Neede", "Hof van Twente", "Hoogezand-Sappemeer", "Krimpen", "Geldrop", "Achtkarspelen", "Gemert-Bakel", "Ermelo", "Duiven", "Aa en Hunze", "Geldermalsen", "Haaksbergen", "Schijndel", "Heiloo", "Borne", "Haren", "Oostburg", "Valkenburg", "Rhenen", "Waterland", "Bergschenhoek", "Anna Paulowna", "Bunnik", "Maasbree", "Eijsden", "Nijkerk", "Moerdijk", "Rijssen", "Zevenhuizen-Moerkapelle", "Midden-Drenthe", "Renkum", "Oldenzaal", "Valkenswaard", "Papendrecht", "Boxmeer", "Best", "Delfzijl", "Veendam", "Gilze en Rijen", "Cuijk", "De Wolden", "Steenbergen", "Putten", "Loon op Zand", "Borsele", "Monster", "Leek", "Bunschoten", "Echt", "Bladel", "Winschoten", "Someren", "Driebergen-Rijsenburg", "Zuidhorn", "Heerde", "Druten", "Sint-Oedenrode", "Gennep", "Didam", "Eibergen", "Westervoort", "Voorhout", "Kerkrade", "Schinnen", "Susteren", "Grootegast", "Reusel-De Mierden", "Axel", "Schoonhoven", "Maasdonk", "De Lier", "Opmeer", "Raalte", "Woudenberg", "Hellendoorn", "Ambt Montfort", "Coevorden", "Bleiswijk", "Epe", "Naaldwijk", "Dalfsen", "Zaltbommel", "Buren", "Zevenaar", "Beuningen", "Langedijk", "Oisterwijk", "Dongeradeel", "Sliedrecht", "Wierden", "Goirle", "Kesteren", "Veere", "Woensdrecht", "Elburg", "Brummen", "Franekeradeel", "Gendringen", "Hillegom", "Zundert", "Cranendonck", "Tubbergen", "Meerssen", "Helden", "Groesbeek", "Aalten", "Eersel", "Bergeijk", "Oirschot", "Middelharnis", "Urk", "Ommen", "Wateringen", "Nederweert", "Asten", "Harenkarspel", "Harlingen", "Boskoop", "Rijnsburg", "Son en Breugel", "Noordwijkerhout", "Winsum", "Smallingerland", "Beesel", "Margraten", "Rozenburg", "Noordoostpolder", "Appingedam", "Bemmel", "Aalburg", "Kapelle", "Hattem", "Etten-Leur", "Doesburg", "Zijpe", "Simpelveld", "Mill en Sint Hubert", "Veghel", "Nieuwkoop", "Roerdalen", "Borculo", "Landsmeer", "Mierlo", "Haelen", "Vriezenveen", "Strijen", "Arcen en Velden", "Noordenveld", "Schipluiden", "Tynaarlo", "Tytsjerksteradiel", "Horst", "Sint-Michielsgestel", "Edam-Volendam", "Skasterlan", "Drimmelen", "Werkendam", "Nunspeet", "Tholen", "Voorst", "Sassenheim", "Köthen", "Oldebroek", "Rucphen", "Losser", "Laarbeek", "Alphen aan den Rijn", "Geertruidenberg", "Dantumadeel", "'s-Gravenzande", "Kronenberg", "Wisch", "Westerveld", "Rijnwoude", "Alblasserdam", "West Maas en Waal", "Hardinxveld-Giessendam", "Eemsmond", "Bour", "Vlagtwedde", "Nuth", "Staphorst", "Heeze-Leende", "Slochteren", "Hilvarenbeek", "Sanem", "Landerd", "Woudrichem", "Menaldumadeel", "Scheemda", "Giessenlanden", "Esch-Alzette", "Pekela", "Texel", "Lopik", "Maasbracht", "Kollumerland", "Gorssel", "Montfoort", "Voerendaal", "Oudewater", "Bernisse", "Wieringermeer", "Heusden", "Menterwolde", "Heythuysen", "Elista", "Sint Anthonis", "Muiden", "Goedereede", "Neerijnen", "De Marne", "Loppersum", "Zelhem", "Bedum", "Wijk bij Duurstede", "Vaals", "Jacobswoude", "Schouwen-Duiveland", "Oostflakkee", "Vlist", "Liesveld", "Halderberge", "Opsterland", "Bernheze", "'s-Gravendeel", "Ooststellingwerf", "Terschelling", "Borger-Odoorn", "Kamnik", "Denekamp", "Weststellingwerf", "Albergen"]
  COUNTRY = 'NL'

  def self.get_data
    meetup_api = MeetupApi.new
    
    setting = ConfigurationSetting.get_settings
    is_success = false
    unless setting.groups_data_completed
      CITIES[setting.current_city_index..1000].each do |city|

        while 1 do
          setting = setting.reload
          offset = setting.users_offset
          result = get_groups(meetup_api, offset, city)
          is_success = result[:success]
          
          if result[:count] < 200
            break
          else
            offset = offset + 1
            setting.update_attribute(:groups_offset, offset)
          end
        end

        if is_success
          setting.update_attributes(current_city_index: ConfigurationSetting.get_settings.current_city_index + 1, groups_offset: 0)
        else
          puts "Credentials have been throttled! Wait for an hour, if still same error, then wait for a day atleast"
          break
        end
      end
      setting.update_attribute(:groups_data_completed, true)
    end

    unless setting.users_data_completed && !setting.groups_data_completed
      group_ids = Group.where("id >= ?", setting.current_group_id).order(:id).pluck(:meetup_group_id)
      group_ids.each do |group_id|
        while 1 do
          setting = setting.reload
          offset = setting.users_offset
          result = get_users(meetup_api, offset, group_id)
          is_success = result[:success]
          
          if result[:count] < 200
            break
          else
            offset = offset + 1
            setting.update_attribute(:users_offset, offset)
          end
        end

        if is_success
          setting.update_attributes(current_group_id: ConfigurationSetting.get_settings.current_group_id + 1, users_offset: 0)
        else
          puts "Credentials have been throttled! Wait for an hour, if still same error, then wait for a day atleast"
          break
        end
      end
      setting.update_attribute(:users_data_completed, true)
    end
  end

  private
  def self.get_groups (api_object, offset, city)
    results = api_object.groups({country: COUNTRY, city: city, offset: offset, format: 'json'})

    if check_throttled?(results)
      return {success: false, count: 0}
    else
      results["results"].each do |group|
        if Group.find_by_meetup_group_id(group["id"]).blank?
          Group.create(meetup_group_id: group["id"], country: group["country"], city: group["city"], link: group["link"], description: group["description"], name: group["name"], urlname: group["urlname"])
        end
      end
      return {success: true, count: results["results"].count}
    end
  end

  def self.get_users (api_object, offset, group_id)
    results = api_object.members({country: COUNTRY, group_id: group_id, offset: offset, format: 'json'})

    if check_throttled?(results)
      return {success: false, count: 0}
    else
      results["results"].each do |user|
        if User.find_by_meetup_user_id(user["id"]).blank?
          topic_list = []
          user["topics"].each { |topic| topic_list << topic["name"] }
          meetup_user = User.new(meetup_user_id: user["id"], country: user["country"], city: user["city"], link: user["link"], lon: user["lon"], lat: user["lat"], name: user["name"], status: user["status"])
          meetup_user.tag_list = topic_list
          meetup_user.save
        end
      end
      return {success: true, count: results["results"].count}
    end
  end

  def self.check_throttled? (results)
    details = results["details"]
    code = results["code"]
    problem = results["problem"]

    if details == "Credentials have been throttled" || code == "throttled" || problem == "Client throttled"
      ConfigurationSetting.get_settings.update_attribute(:last_error_timestamp, Time.now)
      return true
    else
      ConfigurationSetting.get_settings.update_attribute(:last_error_timestamp, nil)
      return false
    end
  end
end
