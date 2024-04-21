extends Control
const HASH_CASE_YES = 0
const HASH_CASE_NO = 1
class_name Hash_table
tool
class HashEntry:
    var key
    var value
    func _init(key, value):
        self.key = key
        self.value = value
        self.inuse = 0

class Hashtable:
    var tabla_hash = {}
    var size = 0
    var inuse = 0
    var nocase = false

    func _init(size, nocase=false, case_sensitive=true):
        self.size = size
        self.nocase = nocase
        self.case_sensitive = case_sensitive

    func hash_table_enter(key, value):
        tabla_hash[key] = HashEntry.new(key, value)
        inuse += 1
        return 1

    func hash_table_display():
        print("Tabla Hash:")
        for key in tabla_hash.keys():
            var entry = tabla_hash[key]
            print("Clave:", key, "Valor:", entry.value)

    func hash_table_free():
        tabla_hash.clear()
        inuse = 0

    func hash_table_remove(key):
        if key in tabla_hash:
            tabla_hash.erase(key)
            inuse -= 1
            return true
        else:
            return false

    func get_value(key):
        if key in tabla_hash:
            return tabla_hash[key].value
        else:
            return null

func hash_table_new(size, casearg):
    var case_sensitive = casearg == HASH_CASE_YES
    return Hashtable.new(size, case_sensitive)

func _ready():
    tablas_hash()

func tablas_hash():
    var ht = hash_table_new(10, HASH_CASE_YES) # Creamos la tabla hash
    if ht.hash_table_enter("-hmmdump", 1) != 1:
        print("Fallo al insertar -hmmdump")
    if ht.hash_table_enter("-svq4svq", 1) != 1:
        print("Fallo al insertar -svq4svq")
    if ht.hash_table_enter("-lm", 1) != 1:
        print("Fallo al insertar -lm")
    if ht.hash_table_enter("-beam", 1) != 1:
        print("Fallo al insertar -beam")
    if ht.hash_table_enter("-lminmemory", 1) != 1:
        print("Fallo al insertar -lminmemory")
    ht.hash_table_display()
    var value = ht.get_value("-lm") # Obtenemos el valor asociado a '-lm'
    print("Valor asociado a '-lm':", value)
    # Mostramos la tabla hash
    ht.hash_table_free()
