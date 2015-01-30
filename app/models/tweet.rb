class Tweet < ActiveRecord::Base

    include Twitter::Extractor

    def extract_hash_tags
        extract_hashtags(self.tweet)
    end

    validate :hashtags_created

    def hashtags_created
        begin
            transaction do
                @hashtags = self.extract_hash_tags

                @hashtags.each do |tag|
                    if Hashtag.where(h: tag).any?
                    else
                        if Hashtag.create!(h: tag)
                        else
                            self.errors.add(:tweet, "the hashtag is invalid")
                        end
                    end
                end
            end
        rescue
            self.errors.add(:tweet, "The hashtag(s) are invalid")
        end
    end
    belongs_to :user

    validates :tweet, length: {maximum:140}
end
