package org.alfresco.web.extensibility;

import java.util.Map;

import org.springframework.extensions.surf.RequestContext;
import org.springframework.extensions.surf.extensibility.impl.DefaultSubComponentEvaluator;

/**
 * <p>
 * Evaluator used to decide if a {@code<sub-component>} shall be bound in to a {@code<component>} and {@code<@region>}.
 * </p>
 *
 * <p>
 * Returns true if we are inside a site AND that site's id matches the regexp from the {@code<sites>} parameter.
 * </p>
 *
 * <p>
 * Note! The regexp is expressed without using the surrounding // characters.
 * </p>
 * <p>
 * Note! the default value of the {@code<sites>} parameter is ".*" which will make it match all site's ids.
 * </p>
 *
 * <p>
 * Example:
 * </p>
 *
 * <pre>{@code
 * <evaluator type="site.component.evaluator"/>
 * }</pre>
 *
 * <p>
 * Will return tru if we are in a site, no matter what the id of the site is.
 * </p>
 *
 * <p>
 * Example 2:
 * </p>
 *
 * <pre>{@code
 * <evaluator type="site.component.evaluator">
 *    <params>
 *       <sites>marketing|engineering</referrer>
 *    </params>
 * </evaluator>
 * }</pre>
 *
 * <p>
 * Will return true if we are inside a site with an id of "marketing" or "engineering".
 * </p>
 *
 * @author ewinlof
 */
public class SlingshotPageContextComponentElementEvaluator extends DefaultSubComponentEvaluator
{
    // Evaluator parameters
    public static final String PAGE_CONTEXT_FILTER = "pagecontext";

    protected SlingshotEvaluatorUtil util = null;

    public void setSlingshotEvaluatorUtil(SlingshotEvaluatorUtil slingshotExtensibilityUtil)
    {
        this.util = slingshotExtensibilityUtil;
    }

    /**
     * Decides if we are there is a page context set
     *
     * @param context
     * @param params
     * @return true if we are in a site and its id matches the {@code<sites>} param (defaults to ".*")
     */
    @Override
    public boolean evaluate(RequestContext context, Map<String, String> params)
    {
        String pageContext = util.getPageContext(context);

        // If we are in a site use site filters
        if (pageContext != null && pageContext.matches(util.getEvaluatorParam(params, PAGE_CONTEXT_FILTER, ".*")))
        {
            return true;
        }

        // The page context didn't match the page context filter
        return false;
    }

}
