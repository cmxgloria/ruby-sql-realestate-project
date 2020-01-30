require 'pg'

def run_sql(sql, args=[])
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'realestate_app'})
  results = conn.exec_params(sql, args)
  conn.close
  return results 
end
