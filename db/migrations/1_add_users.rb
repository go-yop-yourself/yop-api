Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :username
      String :device_token
      index [:username], :unique => true
    end
  end

  down do
    drop_table(:users)
  end
end
