class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :name
      t.integer  :code
      t.text     :coords
      t.string   :key
      t.integer  :company_id
      t.text     :description
      t.text     :business_project
      t.integer  :owner_id
      t.integer  :economic_activity_code
      t.integer  :territory_code
      t.text     :territory_description
      t.text     :availability_of_raw # Обеспечение сырьем
      t.text     :planned_production # Планируемая продукция
      t.text     :consumer_market_description # Описание рынка потребителей
      t.text     :readiness #Степень готовности и экспертиза проекта
      t.text     :financial_evaluation #Финансовая оценка проекта
      t.text     :common_price
      t.float    :own_investments # собственные вкладываемые средства
      t.float    :required_investments # запрашиваемые средства
      t.text     :key_performance_indicators # Основные показатели эффективности проекта
      t.integer  :npv # Чистая приведенная стоимость (NPV), млн. руб.
      t.integer  :irr # Внутренняя норма прибыли (IRR), %
      t.integer  :pi # Индекс рентабельности (PI)
      t.integer  :payback_period # Срок окупаемости, лет
      t.text     :social_significance # социальная значимость
      t.integer  :jobs
      t.integer  :budget_efficiency  # Бюджетная эффективность
      t.text     :investment_return_forms  # Формы возврата инвестиций
      t.text     :additional_info
      t.boolean  :demo_mode

      t.integer :project_type_id

      t.timestamps
    end
    add_index(:projects, :company_id)
    add_index(:projects, :owner_id)
    add_index(:projects, :project_type_id)
    add_index(:projects, :economic_activity_code)
  end
end
