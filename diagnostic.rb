require 'csv'
# Diagnostic answers to:

# question 2:
INSERT INTO licensees
(surname, given_name, gender, height, weight, born_on, eye_color, hair_color)
VALUES
('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');
# question 3:
Licensee.transaction do
  CSV.foreach 'data/licensees.csv', headers: true do |row|
  end
end

# question 4:
SELECT * FROM Licensees WHERE eye_color = 'Hazel' AND hair_color = 'Brown' OR hair_color = 'Black';
# question 5:
DELETE FROM licensees WHERE surname = 'rich' AND surname = 'Myers';
