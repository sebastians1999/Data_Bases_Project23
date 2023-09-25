def parse_generated_entities(file_to_parse):
    entities = []
    current_entity = {}
    with open(file_to_parse, 'r') as file:
        for line in file:
            line.strip()
            if line.startswith('---'):
                if current_entity:
                    entities.append(current_entity)
                current_entity = {}
            elif '=' in line:
                key, value = line.split('=')
                current_entity[key.strip('"')] = value.strip('"')
    if(current_entity):
        entities.append(current_entity)
    return entities

#parse the text_file
path_of_file_to_parse = "generated_entities.txt"
parsed_entities = parse_generated_entities(path_of_file_to_parse)
print(parsed_entities)