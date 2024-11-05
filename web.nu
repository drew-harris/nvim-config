# API Settings
let api_key = $env.API_KEY

let base_url = "https://typesense.drewh.net";

# Headers as record
let headers = {
    "X-TYPESENSE-API-KEY": $api_key
    "Content-Type": "application/json"
};

let new_collection = {
         "name": "stufflol",
         "fields": [
           {"name": "content", "type": "string", "facet": true },
           {"name": "people", "type": "int32" },
         ],
         "default_sorting_field": "people"
       }

let collection_name = 'col_rXArsqiazrBeztGa'
let collections = http get https://typesense.drewh.net/collections --headers $headers

###

# Get Collections
$collections  | to json


# get specific collection
http get $"https://typesense.drewh.net/collections/($collection_name)" --headers $headers | table -e

# Delete created collection
http delete $"https://typesense.drewh.net/collections/stufflol" --headers $headers | print

print $new_collection | table -e;

# create new collection
http post $"https://typesense.drewh.net/collections" ($new_collection | to json) --headers $headers | print

# Search
let params = {
  q: "test"
  query_by: "content"
}
let url = $"https://typesense.drewh.net/collections/($collection_name)/documents/search?($params | url build-query)"
http get $url --headers $headers | get hits.document  | reject "content";

zsh -c "curl -s 'https://jsonplaceholder.typicode.com/posts/1' | jq" | from json | table

