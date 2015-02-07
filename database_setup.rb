DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS locations 
                  (id INTEGER PRIMARY KEY,
                   location_name TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS categories 
                  (id INTEGER PRIMARY KEY,
                   manufacturer TEXT)")
                   
DATABASE.execute("CREATE TABLE IF NOT EXISTS products 
                  (id INTEGER PRIMARY KEY,
                  name TEXT, 
                  FOREIGN KEY(location_id) REFERENCES locations(id) INTEGER,
                  FOREIGN KEY(category_id) REFERENCES categories(id) INTEGER,
                  description TEXT, 
                  cost INTEGER,
                  serial TEXT,
                  quantity INTEGER,
                  )")