class SecurityQuestionTable < ActiveRecord::Migration
  def change
  	create_table :security_questions do |t|
	  t.string :locale, :null => false
	  t.string :name, :null => false
	end

	SecurityQuestion.create! locale: :de, name: 'What was the name of your elementary / primary school?'
	SecurityQuestion.create! locale: :de, name: 'In what city or town does your nearest sibling live?'
	SecurityQuestion.create! locale: :de, name: 'What is your mother\'s maiden name?'
	SecurityQuestion.create! locale: :de, name: 'What was the make of your first car?'
	SecurityQuestion.create! locale: :de, name: 'What is your favorite color?'
	SecurityQuestion.create! locale: :de, name: 'What is your father\'s middle name?'
	SecurityQuestion.create! locale: :de, name: 'What is the name of your first grade teacher?'

	add_column :userlogins, :security_question_id, :integer
	add_column :userlogins, :security_question_answer, :string
  end
end
