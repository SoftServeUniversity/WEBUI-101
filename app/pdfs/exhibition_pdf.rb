class ExhibitionPdf < Prawn::Document
  attr_accessor :exhibition

  def initialize(exhibition)
    super()
    @exhibition = exhibition
    exhibition_name
    exhibition_address
    exhibits
    add_page_numbers
  end

  def exhibition_name
    text exhibition.name, size: 20, style: :bold, align: :center
  end

  def exhibition_address
    text "<b>address:</b> #{exhibition.adress}", size: 12, style: :italic, align: :center, inline_format: true
  end

  def exhibits
    #replace temporary_exhibits with exhibition.exhibits when 'add exhibits to exhibition' option will be available in app
    temporary_exhibits.map do |exhibit|
      render_exhibit(exhibit)
      start_new_page if exhibit[:id] % 3 == 0
    end
  end

  def render_exhibit(exhibit)
    move_down 20
    bounding_box([0, cursor], width: 500, height: 200) do
      bounding_box([10, cursor - 10], width: 480, height: 180) do
        font 'Times-Roman', style: :normal
        exhibit_name(exhibit)
        exhibit_description(exhibit)
        transparent(0) {}
      end
      transparent(0.2) { stroke_bounds }
    end
  end

  def exhibit_name(exhibit)
    pad_top(10) do
      text "<b>Name:</b> #{exhibit[:name].truncate(80)}", align: :justify, inline_format: true
    end
  end

  def exhibit_description(exhibit)
    pad_top(10) do
      text "<b>Description:</b> #{exhibit[:description].truncate(1000)}", align: :justify, inline_format: true
    end
  end

  def add_page_numbers
    string = 'page <page> of <total>'
    options = {
      :at => [bounds.right - 100, 0],
      :aling => :right,
      :start_count_at => 1,
      :style => :bold
    }
    number_pages string, options
  end

  def temporary_exhibits
    [
      {id: 1, name: 'The Three Stigmata of Palmer Eldritch The Three Stigmata of Palmer Eldritch The Three Stigmata of Palmer Eldritch', description: "The story begins in a future world where global temperatures have risen so high that in most of the world it is unsafe to be outside without special cooling gear during daylight hours. This is due to seemingly unknown reasons, however it is later discovered that the Proxans have designed the rising temperatures so humans would scatter to other worlds, dividing them and forcing the Can-D/Chew-Z trade to flourish. In a desperate bid to preserve humanity and ease population burdens on Earth, the UN has initiated a 'draft' for colonizing the nearby planets, where conditions are so horrific and primitive that the unwilling colonists have fallen prey to a form of escapism involving the use of an illegal drug (CAN-D) in concert with 'layouts'. Layouts are physical props intended to simulate a sort of alternate reality where life is easier than either the grim existence of the colonist in their marginal off-world colonies, or even Earth, where global warming has progressed to the point that Antarctica is prime vacation resort territory. The illegal drug CAN-D allows people to 'share' their experience of the 'Perky Pat' (the name of the main female character in the simulated world) layouts. This 'sharing' has caused a pseudo-religious cult or series of cults to grow up around the layouts and the use of the drug."},
      {id: 2, name: 'Flow My Tears, The Policeman Said', description: "The novel is set in a dystopian future United States following a Second Civil War which led to the collapse of the nation's democratic institutions. The National Guard ('nats') and US police force ('pols') reestablished social order through instituting a dictatorship, with a 'Director' at the apex, and police marshals and generals as operational commanders in the field. Resistance to the regime is largely confined to university campuses, where radicalized former university students eke out a desperate existence in subterranean kibbutzim. Recreational drug use is widespread, and the age of consent has been lowered to twelve. Most commuting is undertaken by personal aircraft, allowing great distances to be covered in little time."},
      {id: 3, name: 'A Scanner Darkly', description: "The protagonist is Bob Arctor, member of a household of drug-users, who is also living a parallel life as Agent Fred, an undercover police agent assigned to spy on Arctor's household. Arctor/Fred shields his true identity from those in the drug subculture, and from the police themselves. (The requirement that narcotics agents remain anonymous, to avoid collusion and other forms of corruption, becomes a critical plot point late in the book.) While supposedly only posing as a drug user, Arctor becomes addicted to 'Substance D' (also referred to as 'Slow Death,' 'Death,' or 'D'), a powerful psychoactive drug. An ongoing conflict is Arctor's love for Donna, a drug dealer through whom he intends to identify high-level dealers of Substance D. Arctor's persistent use of the drug causes the two hemispheres of his brain to function independently, or 'compete.' Through a series of drug and psychological tests, Arctor's superiors at work discover that his addiction has made him incapable of performing his job as a narcotics agent. Donna takes Arctor to 'New-Path,' a rehabilitation clinic, just as Arctor begins to experience the symptoms of Substance D withdrawal. It is revealed that Donna has been a narcotics agent all along, working as part of a police operation to infiltrate New-Path and determine its funding source. Without his knowledge, Arctor has been selected to penetrate the secretive organization."},
      {id: 4, name: 'Eye in the Sky', description: "While on a visit to the (fictional) Belmont Bevatron, eight people become stuck in a series of subtly unreal worlds, caused by the malfunction of the particle accelerator. These are later revealed to be solipsistic manifestations, bringing the story in line with Dick's penchant for subjective realities. As well as his future discussions of theology and fears about McCarthy-era authoritarianism, the novel skewers several human foibles.Jack Hamilton, the central protagonist, is dismissed from his job at the California Maintenance Labs due to McCarthy-era paranoia about his wife Marsha's left-wing political sympathies. Other affected members of the injured touring party include Bill Laws, a Physics PhD who happens to be a Negro, who happens to be employed as a tour guide within the plant. The above-mentioned Arthur Silvester is an elderly believer in the obsolete geocentric cosmology. Joan Reiss is a pathologically paranoid woman. Edith Pritchet is a maternal but censorious elderly woman. In succession, the group moves through solipsistic personalized alternate realms related to the beliefs and opinions of Arthur Silvester, Pritchet, Reiss and a hardline Marxist caricature of contemporary US society. Marsha Hamilton's subconscious perceptions, however, did not produce this alternate reality, as originally thought. It originates instead from an unexpected source, revealed as Charles McFeyffe, a Communist sympathizer who works as chief security officer in the California Maintenance Labs plant."},
      {id: 5, name: 'Dr. Bloodmoney, or How We Got Along After the Bomb', description: "Dr. Bloodmoney is set in a post-apocalyptic future. In 1972, before the start of the narrative, Dr. Bruno Bluthgeld (German for 'Blood-Money') had led a project testing nuclear weapons as a protectionary measure against Communist China and the Soviet Union. However, a miscalculation caused an atmospheric nuclear accident leading to widespread fallout and mutations. More recently the United States has been involved in a prolonged period of hostilities with China and the Soviet Union erupting in a war in Cuba."},
      {id: 6, name: 'Do Androids Dream of Electric Sheep?', description: "Do Androids Dream of Electric Sheep? takes place in the year 1992,[1] after World War Terminus and its radioactive fallout have ruined most of Earth. The U.N. encourages emigration to off-world colonies, in hope of preserving the human race from the terminal effects of the fallout. One emigration incentive is giving each emigrant an 'andy' — a servant android.The remaining populace live in cluttered, decaying cities in which radiation poisoning sickens them and damages their genes. Animals are rare, and keeping and owning live animals is an important societal norm and status symbol. But many people turn towards the much cheaper synthetic, or electric, animals to keep up the pretense. Prior to the story's beginning Rick Deckard owned a real sheep, but it died of tetanus, and he replaced it with an electric one.The story is set in and around the San Francisco Bay Area, one of the last places affected by the radioactive dust, especially on the peninsula to the south. It is monitored daily by meteorologists using the Mongoose weather satellite in Earth orbit. While still relatively habitable, the sandy deserts of Oregon to the north are highly contaminated by radiation. Rick Deckard stays in a building on the east side of the bay with his wife, Iran, who is depressed. J.R. Isidore lives on the peninsula south of San Francisco."},
      {id: 7, name: 'Ubik', description: "The novel takes place in the 'North American Confederation' of 1992, wherein technology has advanced to the extent of permitting civilians to reach the Moon, and psi phenomena are common. The novel's protagonist, Joe Chip, is a debt-ridden technician for Glen Runciter's 'prudence organization', which employs people with the ability to block certain psychic powers (as in the case of an anti-telepath, who can prevent a telepath from reading a client's mind) to enforce privacy by request. Runciter runs the company with the assistance of his deceased wife Ella, who is kept in a state of 'half-life', a form of cryonic suspension that gives the deceased person limited consciousness and communication ability.When business magnate Stanton Mick hires Runciter’s company to secure his lunar facilities from telepaths, Runciter assembles eleven agents for this task. The group includes Pat Conley, a mysterious young woman who has an unprecedented parapsychological ability to undo events by changing the past. Joe Chip and Pat have a repressed and distrustful sexual tension throughout, Joe keenly aware of Pat's beauty, and Pat in spiteful contempt of Joe's love apparent, Wendy Wright."}
    ]
  end

end

