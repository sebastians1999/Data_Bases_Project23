def parse_generated_entities(file_to_parse):
    entities = []
    
    with open(file_to_parse, 'r') as file:
        current_entity = {}
        category = None  # Initialize category
        for line in file:
            line = line.strip()
            if line.startswith('---'):
                if current_entity:
                    current_entity['category'] = category  # Include the category
                    entities.append(current_entity)
                current_entity = {'category': category}  # Initialize entity with category
                category = line.strip('-').strip().lower()  # Extract and store the category
            elif '=' in line:
                key, value = line.split('=')
                current_entity[key.strip('"')] = value.strip('"')
        if current_entity:
            current_entity['category'] = category  # Include the category for the last entity
            entities.append(current_entity)
    return entities

# Parse the text_file
path_of_file_to_parse = "generated_entities.txt"
parsed_entities = parse_generated_entities(path_of_file_to_parse)

# for entity in parsed_entities[:10]:
#   print(entity)

