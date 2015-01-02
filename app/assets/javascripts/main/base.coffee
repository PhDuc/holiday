window.Base = @Base || {}

Base.setUp = () ->
  $(document).on 'click', '.icon-social', Base.openSocialLink

Base.openSocialLink = (event) ->
  name = $(event.target).attr('class').replace('icon-social ', '')
  regex = /^.*\[missing.*translation\]$/

  if name == 'email-me'
    # open email modal
  else if regex.test(I18n.t('social_link.'+ name)) == true
    # notify missing link error
  else
    window.open(I18n.t('social_link.'+ name))

$ -> Base.setUp()

