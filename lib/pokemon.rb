class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db  #don't understand the concept of the @db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        # query =<<-TAB
        # INSERT INTO pokemon 
        # VALUES (?, ?, ?)
        # TAB
        #DB[:conn].execute(query, self.name, self.type)
        #@id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        query =<<-SQL 
        SELECT * FROM pokemon
        WHERE id = ?
        SQL
        res = db.execute(query, id).flatten
        id, name, type = res
        self.new(id: id, name: name, type: type, db: db)
    end

end
