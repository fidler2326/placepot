module MeetingsHelper
  def display_likes(horse)
    votes = horse.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end
  private
  def list_likers(votes)
    emails = []
    unless votes.blank?
      votes.voters.each do |voter|
      emails.push(link_to voter.email,
      # profile_path(voter.email),
      class: 'email')
    end
    emails.to_sentence.html_safe + like_plural(votes)
    end
  end
  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end
  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
