# convention is helpful

def run_sql(sql, args = [])
  conn = PG.connect(dbname: 'realestate_app')
  results = conn.exec_params(sql, args)
  conn.close
  return results 
end
def create_dish(name, image_url,user_id)
    # sql = "insert into dishes (name, image_url,user_id)"
    # sql += "values ('#{params[:name]}', '#{params[:image_url]}', #{current_user[:user_id]});"

    # another way if got more lines, can seperate like this
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

def find_fish_by_id()
end

def delete_dish()
end



