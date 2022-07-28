class CardDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :card_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      card_holder_name: { source: "Card.card_holder_name" },
      card_number:      { source: "Card.card_number" },
      cvv_number:       { source: "Card.cvv_number" },
      valid_from:       { source: "Card.valid_from" },
      valid_upto:       { source: "Card.valid_upto" },
      user_id:          { source: "Card.user_id" },
      card_type:        { source: "Card.card_type" },
      bank_name:        { source: "Card.bank_name" }
    }
  end

  def data
    records.map do |record|
      {
        card_holder_name: link_to(record.card_holder_name, card_path(record)),
        card_number:      record.card_number,
        cvv_number:       record.cvv_number,
        valid_from:       record.valid_from,
        valid_upto:       record.valid_upto,
        user_id:          record.user_id,
        card_type:        record.card_type,
        bank_name:        record.bank_name
      }
    end
  end

  def get_raw_records
    # insert query here
    # Card.all
    if params[:card_type] == "debit"
      @cards = Card.all.where(card_type:0)
    elsif params[:card_type] == "credit"
      @cards = Card.all.where(card_type:1)
    else
      @cards = Card.all
    end
  end

end
