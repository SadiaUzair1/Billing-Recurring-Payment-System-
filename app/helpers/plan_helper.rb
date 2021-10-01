# frozen_string_literal: true

module PlanHelper
  def display_options(user, plan)
    if user.admin?
      ('<td><a class="btn btn-dark" href="/users/' + user.id.to_s + '/plans/' + plan.id.to_s + '/edit">Edit Plan</a></td>
            <td><a class="btn btn-dark" href="/users/' + user.id.to_s + '/plans/' + plan.id.to_s + '/features/new">Add Feature</a></td>
            <td><a class="btn btn-dark" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/users/' + user.id.to_s + '/plans/' + plan.id.to_s + '">Delete Plan</a></td>').html_safe
    else
      "<td><a class=\"btn btn-dark\" data-remote=\"true\" rel=\"nofollow\" data-method=\"post\" href=\"/users/#{user.id}/plans/#{plan.id}/checkouts\">SUBSCRIBE</a></td>".html_safe
    end
  end
end
