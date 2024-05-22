require "byebug"
class HTML
  def initialize(&block)
    @rendered_html = ""
    instance_eval(&block)
  end

  def method_missing(tag, *args, &block)
    if args.first.is_a? Hash
      properties = args.shift.map { |p| p.join("=")} * " "
    end
    @rendered_html << "<#{tag} #{properties}>" 
    if block_given?
      instance_eval(&block)
    else
      @rendered_html << "#{args.first}"
    end
    @rendered_html << "</#{tag}>\n"
    # byebug
    # puts @rendered_html
    # puts 
    #   puts
  end

  def render
    @rendered_html
  end
end


html = HTML.new do
  h2 "Why is Arbre awesome?"
  ul do
    li "The DOM is implemented in ruby"
    li "You can create object oriented views"
    li "Templates suck"
  end
end

puts html.render


# html = HTML.new do
#   p id: "nav", class: "list-squares" do
#     li "The DOM is implemented in ruby"
#   end
# end
 


# puts html.render


# <h2>Why is Arbre awesome?</h2>
# <ul>
#   <li>The DOM is implemented in ruby</li>
#   <li>You can create object oriented views</li>
#   <li>Templates suck</li>
# </ul> 



# <ul id="nav" class="list-squares">
#   <li>The DOM is implemented in ruby</li>
# </ul>