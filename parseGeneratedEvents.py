def parse_generated_events(file_to_parse):
    events = []

    with open(file_to_parse, 'r') as file:
        current_event = {}  # Initialize an empty event dictionary

        for line in file:
            line = line.strip()
            if line.startswith('[Event Type]:'):
                if current_event:  # Append the current event to the list (skip for the first event)
                    events.append(current_event)
                event_type = line.split(':')[-1].strip()  # Extract the Event Type
                current_event = {'Event Type': event_type}  # Create the event dictionary with Event Type
            elif ':' in line:
                key, value = line.split(':', 1)
                current_event[key.strip('[]')] = value.strip()
        if current_event:
            events.append(current_event)  # Append the last event
    return events


# #parse the text_file
# path_of_file_to_parse = "generated_events.txt"
# parsed_events = parse_generated_events(path_of_file_to_parse)
  
# for event in parsed_events[:10]:
#     print(event)