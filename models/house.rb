# convention is helpful

def run_sql(sql, args = [])
  conn = PG.connect(dbname: 'realestate_app')
  results = conn.exec_params(sql, args)
  conn.close
  return results 
end
def create_house(name, image_url, price, address, user_id)
  sql = <<~SQL 
  insert into dishes (name, image_url, price, address, user_id)
  values ($1, $2, $3, $4, $5);
  SQL
  run_sql(sql,[name, image_url, price, address, user_id])
end

# use this way to create house in terminal

def all_houses()
  run_sql("select * from houses;")
end

def find_house_by_id()
end

def delete_house()
end



