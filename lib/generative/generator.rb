class Generator

  attr_reader :model_class
  attr_reader :mappings

  def initialize(model_class, mappings)
    @model_class = model_class
    @mappings = mappings
  end

  def build
    model = @model_class.new
    mappings.each do |attribute, type|
      model.send("#{attribute.to_s}=", random_val_for(type) )
    end
    model
  end

  def random_val_for type
    if type == :fixnum
      rand(0..32000)
    elsif type == :string
      "fake random string. blerg"
    else
      ""
    end
  end
end