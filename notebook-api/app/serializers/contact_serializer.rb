class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate
  
  has_many :phones
  has_one  :address

  belongs_to :kind do 
    link(:kind) { kind_url(object.kind.id) }
  end

  meta do 
    { 
      author: :Doug 
    }
  end

end
