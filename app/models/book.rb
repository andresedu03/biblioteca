class Book < ApplicationRecord
    enum status: %W[prestado esta_en_la_libreria]
end
