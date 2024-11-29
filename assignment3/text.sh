#!/bin/bash

declare -A bookings
declare -A cancellations

# Process input data only focus on user source destination and let other variables be anything as we are not concerned about it 
while read -r time d1 user action article ticket from source to destination; do
  if [[ "$action" == "booked" ]]; then
    bookings["$user,$source,$destination"]=1
  elif [[ "$action" == "cancelled" ]]; then
    cancellations["$user,$source,$destination"]=1
  fi
done < data.txt

declare -A user_ticket_count

# Iterate over the bookings and count only those that are not cancelled
for key in "${!bookings[@]}"; do
  if [[ -z "${cancellations[$key]}" ]]; then
    # If no cancellation, count the booking for the user
    ----------------------
  fi
done

# Print results
echo "User | Tickets Booked"
for user in "${!user_ticket_count[@]}"; do
  echo "$user | ${user_ticket_count[$user]}"
done

