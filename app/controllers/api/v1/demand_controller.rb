class Api::V1::DemandController < ApplicationController
  def index
    center = Center.find(params[:id])
    users = center.users
    user_count = users.length
    items = Item.joins(:centers).select('items.*, center_items.quantity').where(centers: {id: params[:id]})
    needs = center.needs

    demands = {consumable: {}, non_consumable: {}}

    items.each do |item|
      if item.consumable
        demands[:consumable][item.name] = {stock: item.quantity}
      else
        demands[:non_consumable][item.name] = {stock: item.quantity}
      end
    end

    default_needs.each do |need|
      item = items.find {|item| item.name.downcase == need.downcase}
      if item.consumable
        demands[:consumable][need][:need] = user_count
      else
        demands[:non_consumable][need][:need] = user_count
      end
    end

    needs.each do |need|
      item = items.find {|item| item.name.downcase == need.name.downcase}
      if item && !item.consumable
        demands[:non_consumable][need.name][:need] ||= 0
        demands[:non_consumable][need.name][:need] += 1
      else
        demands[:consumable][need.name] ||= {need: 0, stock: 0}
        demands[:consumable][need.name][:need] ||= 0
        demands[:consumable][need.name][:need] += 1
      end
    end

    demands[:consumable].transform_values! do |value|
      if value[:need] != 0
        {days_remaining: (value[:stock] / value[:need].to_f).round(0)}
      else
        {days_remaining: value[:stock]}
      end
    end

    demands[:non_consumable].transform_values! do |value|
      {on_hand: value[:stock] - value[:need]}
    end

    render json: demands
  end

  private

  def default_needs
    ["Food", "Water", "Soap", "Bed, Blanket, & Pillow", "Toothbrush",
      "Toothpaste", "Toilet paper", "Clothes", "Medical supplies"]
  end
end
