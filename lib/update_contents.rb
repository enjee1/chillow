module UpdateContents
  def add_item(item, container)
    container << item
  end

  def remove_item(container)
    container.pop
  end
end
